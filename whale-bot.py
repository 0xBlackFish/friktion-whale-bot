import pandas as pd
from google.cloud import bigquery
from discordwebhook import Discord

discord = Discord(url='https://discord.com/api/webhooks/966576493499146281/cSEb7JTmTOjJf9CTRVwuAJQ6z1lKP1eQHWUf0N3LkypfbghjDLuJ3UCTU-kOJW3iqlVa')
#discord = Discord(url='https://discord.com/api/webhooks/966412469155270687/ho5jcQkpvfX2aafDH_OcrlTtYpGuRbKXaSgr4zrDYZpuD6eOswjdePZvgWH6v_gz2Bj5')

discord.post(content="Arghhh...Any whales around here? I'm testing the waters...")