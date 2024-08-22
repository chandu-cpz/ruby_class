
# %%
!sudo apt-get install -y pciutils
!curl -fsSL https://ollama.com/install.sh | sh # download ollama api


# %%
import warnings
warnings.filterwarnings("ignore")

# %%
!pip install -U lightrag[ollama]


# %%
import os
import threading
import subprocess

def ollama(gpu_id, port):
    os.environ['CUDA_VISIBLE_DEVICES'] = str(gpu_id)
    os.environ['OLLAMA_HOST'] = f'0.0.0.0:{port}'
    os.environ['OLLAMA_ORIGINS'] = '*'
    subprocess.Popen(["ollama", "serve"])

ollama_thread_0 = threading.Thread(target=ollama, args=(0, 11434))
ollama_thread_1 = threading.Thread(target=ollama, args=(1, 11435))

ollama_thread_0.start()
ollama_thread_1.start()


# %%
from IPython.display import clear_output
!ollama pull llama3.1:8b
clear_output()

# %%
from lightrag.components.model_client import OllamaClient
from lightrag.core.generator import Generator
from lightrag.core.component import Component
from lightrag.core.model_client import ModelClient
qa_template = r"""<SYS>
You will be given a complaint description your job is to
Sentiment: Positive, Negative, Neutral
Urgency: Urgent, Non-Urgent
Department: which department the compalaint belongs to
give me four fields each one of the  following like "Positive, Urgent,Department"
Dont give more any extra text
</SYS>
User: {{input_str}}
You:"""


class SimpleQA(Component):
    def __init__(self, model_client: ModelClient, model_kwargs: dict):
        super().__init__() 
        self.generator = Generator(
            model_client=model_client,
            model_kwargs=model_kwargs,
            template=qa_template,
        )

    def call(self, input: dict) -> str:
        return self.generator.call({"input_str": str(input)})

    async def acall(self, input: dict) -> str:
        return await self.generator.acall({"input_str": str(input)})

# Create separate clients for each GPU
client_gpu_0 = OllamaClient(host='0.0.0.0:11434')
client_gpu_1 = OllamaClient(host='0.0.0.0:11435')

model_gpu_0 = {
    "model_client": client_gpu_0,
    "model_kwargs": {"model": "llama3.1:8b"}
}

model_gpu_1 = {
    "model_client": client_gpu_1,
    "model_kwargs": {"model": "llama3.1:8b"}
}
qa_gpu_0 = SimpleQA(model_client=model_gpu_0["model_client"], model_kwargs=model_gpu_0["model_kwargs"])
qa_gpu_1 = SimpleQA(model_client=model_gpu_1["model_client"], model_kwargs=model_gpu_1["model_kwargs"])

output_0 = qa_gpu_0.call({"input_str": "Some input text for GPU 0"})
output_1 = qa_gpu_1.call({"input_str": "Some input text for GPU 1"})

print(output_0)
print(output_1)


# %%
count = 0
gpu=True
error_count=0

# %%
def get_labels(complaint_desc):
    global count,gpu,qa_gpu_0,qa_gpu_1,error_count
    try:
          
          count +=1
          if gpu:
            qa= qa_gpu_0
          else:
            qa = qa_gpu_1
            print("Switch to second gpu")
          gpu = not gpu
          print(f"Trying to get labels for{count}")
          print(qa(complaint_desc))
          labels_string = qa(complaint_desc).data
          try:
            print(labels_string.split(","))
          except Exception as err:
            print("Failed to split the string")
          labels_list= labels_string.split(",")
          return  pd.Series({
                'Sentiment': labels_list[0],
                'Urgency': labels_list[1],
                'Department': labels_list[2] if len(labels_list) == 3 else None  # Handle the case where there might be fewer than 4 elements
            })
    except Exception as err:
        error_count+=1
        print(f"The error Is {error_count}")
        print(err)

# %%
import pandas as pd
import numpy as np
import concurrent.futures
df = pd.read_csv("/kaggle/input/cleaned-complaints-datast/Cleaned_complaint_data.csv")

# %%
# # Function to apply the labels function to a DataFrame
# def apply_labels(df, apply_labels_func):
#     df[['Sentiment', 'Urgency', 'Department']] = df['Complaint Description'].apply(apply_labels_func)
#     return df

# # Using ThreadPoolExecutor to run the tasks in parallel
# with concurrent.futures.ThreadPoolExecutor() as executor:
#     # Submit the tasks to the executor for parallel execution
#     future_df_0 = executor.submit(apply_labels, df_0, apply_labels_gpu_0)
#     future_df_1 = executor.submit(apply_labels, df_1, apply_labels_gpu_1)
    
#     # Get the results once they are completed
#     df_0 = future_df_0.result()
#     df_1 = future_df_1.result()

# %%
import multiprocessing as mp
def apply_labels(df, get_labels):
    df[['Sentiment', 'Urgency', 'Department']] = df['Complaint Description'].apply(get_labels)
    return df
def process_chunk(chunk):
    return chunk.apply(get_labels, axis=1)

def parallel_apply(df, n_processes):
    chunks = np.array_split(df, n_processes)
    pool = mp.Pool(processes=n_processes)
    results = pool.map(process_chunk, chunks)
    pool.close()
    pool.join()
    return pd.concat(results)

# %%
df_result = parallel_apply(df,64)

# %%

df_result.to_csv("Final_Labels.csv",index=False)
print("Done saving to csv")

# %%
from IPython.display import FileLink
!zip -r file.zip /kaggle/working/
FileLink(r'file.zip')

