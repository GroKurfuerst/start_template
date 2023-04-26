# start_template

start_api_gateway:

-a eval-api port
-b tts-api port
-c asr-api port
-d api-gateway port
-e edubot-website port

bash start_api_gateway.sh -a 6001 \
                          -b 8061 \
                          -c 8067 \
                          -d 19528 \
                          -e 3000



start_eval_api:

-a eval-api port

bash start_eval_api.sh -a 6001 



start_tts_api:

-a tts-api port

bash start_tts_api.sh -a 8061



start_asr_api:

-a asr-api port

bash start_asr_api.sh -a 8067 



start_templatebot_api:

-a templatebot-api port

bash start_templatebot_api.sh -a 6788 