require_relative 'ghee'

gh = Ghee.basic_auth("usr", "pwd")

all_gists = gh.users("nusco").gists 

a_gist = all_gist[20]

a_gist.url 

a_gist.description

