#Assume all services run in a same instance for now
public_ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# public_ipv4="15.164.178.173"

EVAL_API_PORT=6001
TTS_API_PORT=8061
ASR_API_PORT=8067
API_GATEWAY_PORT=19528
TEMPLATEBOT_API_PORT=6788
FRONT_END_LINK="https://devbox.articulateai.cn"


# EDUBOT_WEBSITE_PORT=

#Fetch configuration
while getopts a:b:c:d:e:f: flag
do
    case "${flag}" in
        a) EVAL_API_PORT=${OPTARG};;
        b) TTS_API_PORT=${OPTARG};;
        c) ASR_API_PORT=${OPTARG};;
        d) API_GATEWAY_PORT=${OPTARG};;
        # e) EDUBOT_WEBSITE_PORT=${OPTARG}
        e) FRONT_END_LINK=${OPTARG};;
        f) TEMPLATEBOT_API_PORT=${OPTARG}
    esac
done

#Set up endpoints
PRON_FLUENCY_SCORING_API="http://$public_ipv4:$EVAL_API_PORT/pron_fluency_score"
REPORT_GEN_API="http://$public_ipv4:$EVAL_API_PORT/score_report"
TTS_API="http://$public_ipv4:$TTS_API_PORT/tts"
ASR_API="http://$public_ipv4:$ASR_API_PORT/home"
TEMPLATEBOT_API="http://$public_ipv4:$TEMPLATEBOT_API_PORT/chat"

#Run the container
sudo docker run -e FRONT_END_LINK=$FRONT_END_LINK \
                -e PRON_FLUENCY_SCORING_API=$PRON_FLUENCY_SCORING_API \
                -e REPORT_GEN_API=$REPORT_GEN_API \
                -e TTS_API=$TTS_API \
                -e ASR_API=$ASR_API \
                -e IELTS_BOT_URL=$TEMPLATEBOT_API \
                -p $API_GATEWAY_PORT:19528 \
                --name api-gateway-container \
                api-gateway
