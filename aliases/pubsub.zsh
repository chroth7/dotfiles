# pubsub
alias psSessionInit1='gcloud pubsub topics publish bb9-debug-topic --message "{\"type\": \"analytic\", \"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"content\": {\"internalId\": \"c1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"consumer\": {\"internalId\": \"cs1\", \"ip\": \"1.1.1.1\"}, \"device\": {\"id\": \"d1\"}, \"ambrite\": {\"sdk\": {\"name\": \"sdk1\", \"version\": \"sdkv1\"}}, \"app\": {\"name\": \"a1\", \"version\": \"v1\", \"url\": \"url1\"}, \"message\": \"sessionInit\", \"ts\": $(date +%s999), \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36\"}"' 

alias psSessionInit2='gcloud pubsub topics publish bb9-debug-topic --message "{\"type\": \"analytic\", \"session\": {\"id\": \"s2\", \"messageNr\": 2}, \"content\": {\"internalId\": \"c2\"}, \"context\": {\"internalId\": \"cx2\"}, \"component\": {\"internalId\": \"cp2\"}, \"consumer\": {\"internalId\": \"cs2\", \"ip\": \"2.2.2.2\"}, \"device\": {\"id\": \"d2\"}, \"ambrite\": {\"sdk\": {\"name\": \"sdk2\", \"version\": \"sdkv2\"}}, \"app\": {\"name\": \"a2\", \"version\": \"v2\"}, \"message\": \"sessionInit\", \"ts\": $(date +%s999), \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36\", \"stack\": {\"browser\": {\"warp\": \"Captain Kirk\"}}}"' 

alias psSessionInitInvalid='gcloud pubsub topics publish bb9-debug-topic --message "{\"type\": \"analytic\", \"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"content\": {\"internalId\": \"c1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"consumer\": {\"internalId\": \"cs1\", \"ip\": \"1.1.1.1\"}, \"device\": {\"id\": \"d1\"}, \"ambrite\": {\"sdk\": {\"name\": \"sdk1\", \"version\": \"sdkv1\"}}, \"app\": {\"name\": \"a1\", \"version\": \"v1\"}, \"message\": \"sessionInit\", \"ts\": -1, \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36\"}"' 

alias psEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"t1\", \"message\": \"m1\", \"ts\": $(date +%s999)}"'

alias psEvent2='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s2\", \"messageNr\": 2}, \"consumer\": {\"internalId\": \"cs2\"}, \"content\": {\"internalId\": \"ct2\"}, \"context\": {\"internalId\": \"cx2\"}, \"component\": {\"internalId\": \"cp2\"}, \"label\": \"l2\", \"type\": \"t2\", \"message\": \"m2\", \"ts\": $(date +%s999)}"'

alias psAckbarEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"t1\", \"message\": \"TTFB\", \"ts\": $(date +%s999), \"value\": 123}"'

alias psAckbarEvent2='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s2\", \"messageNr\": 2}, \"consumer\": {\"internalId\": \"cs2\"}, \"content\": {\"internalId\": \"ct2\"}, \"context\": {\"internalId\": \"cx2\"}, \"component\": {\"internalId\": \"cp2\"}, \"label\": \"l2\", \"type\": \"t2\", \"message\": \"LCP\", \"ts\": $(date +%s999), \"value\": 123}"'

alias psAckbarEvent1NoValue='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"t1\", \"message\": \"TTFB\", \"ts\": $(date +%s999)}"'

alias psAckbarEvent2NoValue='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s2\", \"messageNr\": 2}, \"consumer\": {\"internalId\": \"cs2\"}, \"content\": {\"internalId\": \"ct2\"}, \"context\": {\"internalId\": \"cx2\"}, \"component\": {\"internalId\": \"cp2\"}, \"label\": \"l2\", \"type\": \"t2\", \"message\": \"LCP\", \"ts\": $(date +%s999)}"'

alias psSetConsumerEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\", \"id\": \"consumer1\", \"avatar\": \"I am blue\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"analytic\", \"message\": \"setConsumer\", \"ts\": $(date +%s999)}"'
alias psSetContextEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\", \"catEpic\": \"epic1\", \"actionUs\": \"us1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"analytic\", \"message\": \"setContext\", \"ts\": $(date +%s999)}"'

alias psSetContentEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\", \"id\": \"content1\", \"name\": \"contentName1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\"}, \"label\": \"l1\", \"type\": \"analytic\", \"message\": \"setContent\", \"ts\": $(date +%s999)}"'

alias psSetContentEvent2='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s2\", \"messageNr\": 2}, \"consumer\": {\"internalId\": \"cs2\"}, \"content\": {\"internalId\": \"ct2\", \"id\": \"content2\", \"name\": \"contentName2\", \"url\": \"url2\"}, \"context\": {\"internalId\": \"cx2\"}, \"component\": {\"internalId\": \"cp2\"}, \"label\": \"l2\", \"type\": \"analytic\", \"message\": \"setContent\", \"ts\": $(date +%s999)}"'

alias psSetComponentEvent1='gcloud pubsub topics publish bb9-debug-topic --message "{\"session\": {\"id\": \"s1\", \"messageNr\": 1}, \"consumer\": {\"internalId\": \"cs1\"}, \"content\": {\"internalId\": \"ct1\"}, \"context\": {\"internalId\": \"cx1\"}, \"component\": {\"internalId\": \"cp1\", \"name\": \"comp1\", \"version\": \"v1\", \"source\": {\"url\": \"compoSourceUrl1\"}}, \"label\": \"l1\", \"type\": \"analytic\", \"message\": \"setComponent\", \"ts\": $(date +%s999)}"'