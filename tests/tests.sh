#!/bin/bash
outdir=./output
img=./picture.jpg
let passCount=0
let failCount=0
let iterator=0

function _pass()
{
	echo -e " - \e[1;32mOK\e[0m"
	let passCount+=1
}

function _fail()
{
	echo -e " - \e[1;31mFAIL\e[0m"
	let failCount+=1
}

function testcase()
{
	message="$1"
	arguments="$2"

	echo -n "TESTCASE: $message"
	../clearpixel ${arguments} -i $img -o $outdir/img_${iterator}.png &>>$outdir/log.txt && _pass || _fail
	let iterator+=1
}

echo "Cleaning the environment..."
[ -d $outdir ] && rm -r $outdir
mkdir -p $outdir

testcase "Default args" ""
testcase "Downscaling with percent-sign" "-d 75%"
testcase "Downscaling without percent-sign" "-d 75"
testcase "Imagemagick enhance" "-e"
testcase "Imagemagick enhance with downscaling" "-e -d 75%"
testcase "Custom upscale amount" "-u 4"
testcase "Custom upscale amount with downscaling" "-u 4 -d 75%"
testcase "Custom denoise amount" "-n 2"
testcase "Preview picture" "-p"
testcase "Preview picture with downscaling" "-d 75% -p"
testcase "Sharpening with custom sigma set" "-ss 3"
testcase "Sharpening with custom radius set" "-sr 3"
testcase "Sharpening with custom radius and sigma set" "-ss 3 -sr 3"
