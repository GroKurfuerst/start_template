# start_template

start_edubot_website(have default parameters):

bash start_edubot_webiste.sh -a ${edubot-website port} \
                             -b ${api-gateway host} \
                             -c ${api-gateway port}

start_api_gateway:

bash start_api_gateway.sh -a ${eval-api port} \
                          -b ${tts-api port} \
                          -c ${asr-api port} \
                          -d ${api-gateway port} \
                          -e ${edubot-website port}



start_eval_api:

bash start_eval_api.sh -a ${eval-api port} 



start_tts_api:

bash start_tts_api.sh -a ${tts-api port}



start_asr_api:

bash start_asr_api.sh -a ${asr-api port}



start_templatebot_api:

bash start_templatebot_api.sh -a ${templatebot-api port} 