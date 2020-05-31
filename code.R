install.packages("rtweet") 
library(rtweet)
library(httr)
library(twitteR)
## whatever name you assigned to your created app on twitter
 
appname <- "enter your appname" 
key <- " enter api key "
secret <- "enter api secret"
token1 <- "enter access token"

token_secret <- "enter secret access token"

## create token named "twitter_token"

twitter_token <- create_token(app = appname,consumer_key = key,consumer_secret = secret,access_token=token1,access_secret=token_secret)
tweets = search_tweets("#lockdown", n=100, lang='en',include_rts=FALSE)
tw_text=tweets$text
tw_text
tw_text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ", tw_text)	
tw_text = gsub("(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", tw_text)
tw_text = gsub("#\\w+", " ", tw_text)
tw_text = gsub("@\\w+", " ", tw_text)
# Then remove all the punctuation. Underlined in the above image
tw_text = gsub("[[:punct:]]", " ",tw_text)
# Then remove numbers, we need only text for analytics
tw_text = gsub("[[:digit:]]", " ", tw_text)
tw_text = gsub("[ \t]{2,}", " ", tw_text)
tw_text=gsub("[\n]{2,}"," ",tw_text)
tw_text = gsub("^\\s+|\\s+$", "", tw_text)
tw_text = iconv(tw_text, "UTF-8", "ASCII", sub="")
tw_text = tw_text[!is.na(tw_text)]
names(tw_text) = NULL
tw_text = unique(tw_text)

library(SentimentAnalysis)
library(SnowballC)
sentiment <- analyzeSentiment(tw_text)
sentiment$SentimentQDAP
convertToDirection(sentiment$SentimentQDAP)







