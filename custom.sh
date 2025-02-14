if [ -e .env ]; then
  source .env
  if [ "$3" == "load_data" ]; then
    copy_imagenet_to_ddr
  fi
fi

if [ "$FASTDIR" == "" ]; then
  FASTDIR=/workspace
fi

if [ -d $FASTDIR/git/aim-uofa-model-quantization ]; then
  cd $FASTDIR/git/aim-uofa-model-quantization
elif [ -d /workspace/git/aim-uofa-model-quantization ]; then
  cd /workspace/git/aim-uofa-model-quantization
else
  FASTDIR=../..
  cd .
fi


# script=main.py
# train_batch=20
# val_batch=20
# dataset='imagenet'
# root=$FASTDIR/data/imagenet
# case='fake'
# keybase=''
# keyword=','
# model='unknow'
# base=1
# epochs=0
# options=''
# pretrain='none'

# config=config.bin
# if [ "$1" != "" ]; then config=$1; fi
# if [ -e $config ];
# then
  # echo "Loading config from $config"
  # source $config
# fi

# if [ "$DELAY" != "" ]; then
  # delay=$DELAY
# else
  # delay=0
# fi

# if [ "$2" != "" ]; then script=$2; fi

options=''


python main.py --dataset cifar10 --root $FASTDIR/data/cifar10 \
  --model vgg_small --base 1 --weight_decay 0.001 --nesterov\
  --epochs 500 -b 100 -v 100 \
  --case official --keyword cifar10,bac,lq,bacs \
  --delay 0 \
  --fm_bit 3 --wt_bit 3 --fm_enable --wt_enable\
  --save_freq 1
  $options
