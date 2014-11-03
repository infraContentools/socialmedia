require "socialmedia"

# Test facebook
options1 = {
    :name => "random fart",
    :link => "www.google.com"
}
options2 = {
    :message => "random fart"
}
file = "/home/srujan/Downloads/sachin.jpg"
fbpageid = "342007479294679"
userid = "100006046908157"
d = Socialmedia::FacebookApi.new("CAACEdEose0cBAAW7HbgFECqnvY3nuSNdWo2zSpasrDe80ZArFNG1afwFadImZBUfyQT8XPlK05L67Vj02YvFqjmHwevYZCdqe0mTSysGr4ZB7neHHm9XsCzXNHZCdcoZBuio4C1F2E2Qncty4I8GNHFUj9njVHkc8oTncIy1bHwzxqd3iIR7kFtEd4wtsojWGnBzQikohKCrn3vZAwYjJz6")
e = d.publishPost("TESTING",options1)
print(e)


