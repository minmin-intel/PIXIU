pixiu_path='/home/minminho/workspace/PIXIU'
export PYTHONPATH="$pixiu_path/src:$pixiu_path/src/financial-evaluation:$pixiu_path/src/metrics/BARTScore"
echo $PYTHONPATH
# export CUDA_VISIBLE_DEVICES="0"

python src/eval.py \
    --model hf-causal-experimental \
    --tasks flare_ner \
    --model_args use_accelerate=False,pretrained=meta-llama/Llama-3.2-1B-Instruct,tokenizer=meta-llama/Llama-3.2-1B-Instruct,use_fast=True,max_gen_toks=1024,dtype=float32 \
    --no_cache \
    --batch_size 2 \
    --model_prompt 'finma_prompt' \
    --num_fewshot 0 \
    --write_out \
    --device cpu
