def no_prompt(ctx):
    return ctx

def finma_prompt(ctx):
    return f'Human: \n{ctx}\n\nAssistant: \n'

def ner_prompt(text):
    prompt = """\
    In the sentences extracted from financial agreements in U.S. SEC filings, identify the named entities that represent a person (\'PER\'), an organization (\'ORG\'), or a location (\'LOC\'). Output each entity with its type, in this format \'entity name, entity type\'. If there are multiple entities in a sentence, separate them with a new line.
    Text: {text}
    Your answer:"""
    return prompt.format(text=text)

MODEL_PROMPT_MAP = {
    "no_prompt": no_prompt,
    "finma_prompt": finma_prompt,
    "flare_ner_prompt": ner_prompt
}