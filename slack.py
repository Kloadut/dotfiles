#!/usr/bin/env python
'''
Script to post or get the last message from a channel
Install:
# sudo pip install slack_sdk configparser
Also you will need to obtain a slack app token

Put the following in your ~/.slackrc

[slack]
app_token = TOKEN
channel_id = CHANNEL

Usage Example:
 
# slack.py get

# slack.py post "this is a message to post"
'''

import os
import sys
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError
import configparser

configParser = configparser.ConfigParser()
configFilePath = os.path.expanduser("~") + '/.slackrc'
configParser.read_file(open(configFilePath, 'r'))

SLACK_TOKEN = configParser.get('slack', 'app_token')
SLACK_CHANNEL_ID = configParser.get('slack', 'channel_id')

slack_client = WebClient(token=SLACK_TOKEN)

if sys.argv[1] == "post":
    try:
        response = slack_client.chat_postMessage(
          channel=SLACK_CHANNEL_ID,
          text=" ".join(sys.argv[2:])
        )
    except SlackApiError as e:
        print(e.response["error"])

elif sys.argv[1] == "get":
    try:
        response = slack_client.conversations_history(
            channel=SLACK_CHANNEL_ID,
            limit=1
        )

        print(response["messages"][0]["text"])
    except:
        print("Error")
