pixiu_path=$WORKDIR/PIXIU
export PYTHONPATH="$pixiu_path/src:$pixiu_path/src/financial-evaluation:$pixiu_path/src/metrics/BARTScore"
echo $PYTHONPATH
# export CUDA_VISIBLE_DEVICES="0"

python src/eval.py \
    --model endpoint \
    --tasks select \
    --model_args model_name=meta-llama/Meta-Llama-3.1-70B-Instruct,endpoint_url=http://localhost:8086/v1,max_new_tokens=1024 \
    --no_cache \
    --batch_size 1 \
    --model_prompt 'finma_prompt' \
    --num_fewshot 0 \
    --write_out \
    --device cpu \
    --limit 100 \
    --output_path $WORKDIR/datasets/finben_test/llama3.1-70B.json | tee $WORKDIR/datasets/finben_test/llama3.1-70B.log
