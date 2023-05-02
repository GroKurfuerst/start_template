#Download kaldi data
if [ ! -d $HOME/data/kaldi ]; then
    echo "Kaldi data not found"
    if [ ! -f $HOME/data/kaldi.tar.gz ]; then
        echo "Kaldi tar not found, prepare to download"
        sudo aws s3api get-object --bucket docker-container-data --key kaldi.tar.gz $HOME/data/kaldi.tar.gz
    else
        echo "Kaldi tar found"
    sudo tar -xzvf $HOME/data/kaldi.tar.gz -C $HOME/data/
    rm $HOME/data/kaldi.tar.gz
    fi
else
    echo "Kaldi data found"
fi

#Download nltk_data
if [ ! -d $HOME/data/nltk_data ]; then
    echo "nltk data not found"
    if [ ! -f $HOME/data/nltk_data.tar.gz ]; then
        echo "nltk tar not found, prepare to download"
        sudo aws s3api get-object --bucket docker-container-data --key nltk_data.tar.gz $HOME/data/nltk_data.tar.gz
    else
        echo "nltk tar found"
    sudo tar -xzvf $HOME/data/nltk_data.tar.gz -C $HOME/data/
    rm $HOME/data/nltk_data.tar.gz
    fi
else
    echo "Kaldi data not found"
fi

#Download intel-mkl data
if [ ! -d $HOME/data/intel ]; then
    echo "Intel mkl data not found"
    if [ ! -f $HOME/data/intel.tar.gz ]; then
        echo "intel mkl tar not found, prepare to download"
        sudo aws s3api get-object --bucket docker-container-data --key intel.tar.gz $HOME/data/intel.tar.gz
    else
        echo "Intel mkl tar found"
    sudo tar -xzvf $HOME/data/intel.tar.gz -C $HOME/data/
    rm $HOME/data/intel.tar.gz
    fi
else
    echo "Intel mkl data not found"
fi
