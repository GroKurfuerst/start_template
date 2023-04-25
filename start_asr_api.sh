#Assume all services run in a same instance for now
public_ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# public_ipv4="15.164.178.173"

#Fetch configuration
while getopts a: flag
do
    case "${flag}" in
        a) ASR_API_PORT=${OPTARG};;
    esac
done

#Run the container
sudo docker run -p $ASR_API_PORT:8067 \
                --name asr-api-container \
                asr-api