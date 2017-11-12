#!/bin/bash
mkdir .tmp log
arecord -vv -fdat .tmp/test.wav
# rec .tmp/test.wav rate 48k silence 1 0.1 3% 1 3.0 3%
ffmpeg -y -i .tmp/test.wav -ac 1 -ab 48k .tmp/mono.wav
base64 .tmp/mono.wav -w 0 > .tmp/mono.base64
cat json/sync-request.head .tmp/mono.base64 json/sync-request.tail >json/speech-request.json
echo "#!/bin/bash" >.tmp/exec.sh
echo 'export PATH=$PATH:$(pwd)/modules'>.tmp/exec.sh
chmod +x .tmp/exec.sh
./google_v2t.sh | jq '.results[0].alternatives[0].transcript' | sed -e 's/^"//' -e 's/"$//' | tr '[:upper:]' '[:lower:]'>>.tmp/exec.sh
cp .tmp/exec.sh log/exec.sh.log
mv json/speech-request.json log/speech-request.json.log
.tmp/exec.sh
rm -rf .tmp
