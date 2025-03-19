# send local environment variable from local to remote during connection 
ssh -t $USER@$SERVER_EAI_PROD GIT_COMMIT=444bd984a507b84161983e499fb720 bash -l
