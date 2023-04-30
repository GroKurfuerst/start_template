# public_ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

EDUBOT_WEBSITE_PORT=3000
API_GATEWAY_HOST='devbox.articulateai.cn'
API_GATEWAY_PORT=444

#Fetch configuration
while getopts a:b:c: flag
do
    case "${flag}" in
        a) EDUBOT_WEBSITE_PORT=${OPTARG};;
        b) API_GATEWAY_HOST=${OPTARG};;
        c) API_GATEWAY_PORT=${OPTARG};;
    esac
done

sudo docker run -p $EDUBOT_WEBSITE_PORT:80 \
                -e API_GATEWAY_HOST=$API_GATEWAY_HOST \
                -e API_GATEWAY_PORT=$API_GATEWAY_PORT \
                --name edubot-website-container \
                edubot-website