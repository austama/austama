import argparse
import os
from telethon import TelegramClient, events, sync
from telethon.sessions import StringSession
from urllib.parse import urlparse
import socks

async def send(client, state):
    await client.send_message(state['target'], state['message'])

def config(client, state):
    client.set_proxy(config_proxy(state['proxy']))

def config_proxy(proxy):
    if proxy.scheme == 'http':
        print('config proxy')
        host = proxy.netloc.split(':')[0]
        port = int(proxy.netloc.split(':')[1])
        return (socks.HTTP, host, port)    

def init_client(state):
    if state['session'] is not None:
        return TelegramClient(state['session_name'], state['api_id'], state['api_hash'])
    else:
        return TelegramClient(StringSession(state['session']), state['api_id'], state['api_hash'])

def main(state):
    client = init_client(state)
    config(client, state)
    client.start()
    client.run_until_disconnected(send(client, state))

if __name__ == '__main__':
    state = {}
    state['session_name'] = os.getenv('TELEGRAM_SESSION_NAME', None)
    state['api_id'] = os.getenv('TELEGRAM_API_ID', None)
    state['api_hash'] = os.getenv('TELEGRAM_API_HASH', None)
    state['target'] = os.getenv('TELEGRAM_TARGET', None)
    state['message'] = os.getenv('TELEGRAM_MESSAGE', None)
    state['proxy'] = urlparse(os.getenv('TELEGRAM_PROXY', None))
    state['session'] = os.getenv('TELEGRAM_SESSION', None)
    main(state)

