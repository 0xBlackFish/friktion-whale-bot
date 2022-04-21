import pandas as pd
from google.cloud import bigquery
from discord_webhook import DiscordWebhook, DiscordEmbed
from datetime import datetime
import os

# read webhook url from environment
url = os.getenv('DISCORD_WEBHOOK')

# establish google bigquery client
client = bigquery.Client()

# open whale_query.sql file
with open('whale_query.sql') as query:
    query_string = query.read()

# query deposit and withdrawal transactions within the last hour and store as a dataframe
df = client.query(query=query_string).result().to_dataframe()

if df.empty:
    print(datetime.now(), 'No whale transactions found within the last hour, sailing away...')
    pass

else:
    for index, whale in df.iterrows():

        # establish webhook
        webhook = DiscordWebhook(url=url, rate_limit_retry=True)
        
        # color embed based on the user action
        if whale['userAction'] == 'Withdraw':
            color = '34aadc'
        elif whale['userAction'] == 'Deposit':
            color = '5856d6'
            
        # create embed object for webhook
        embed = DiscordEmbed(title='Whale Alert', description=whale['userAction'], color=color)

        # add fields to embed
        embed.add_embed_field(name='Transaction ID', value=whale['txSignature'], inline=False)
        embed.add_embed_field(name='Time', value=whale['timeStamp'], inline=False)
        embed.add_embed_field(name='Whale', value=whale['userAddress'], inline=False)
        embed.add_embed_field(name='Product', value=whale['product_name'],inline=False)
        embed.add_embed_field(name='Volt', value=str(whale['volt_number']))
        embed.add_embed_field(name='Asset', value=whale['deposited_asset'])
        embed.add_embed_field(name='Voltage', value=whale['voltage'])
        embed.add_embed_field(name='Token Amount', value="{:,.0f} {}".format(whale['amount'], whale['deposited_asset']))

        # add embed object to webhook
        webhook.add_embed(embed)

        response = webhook.execute()