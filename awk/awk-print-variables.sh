awk '{
    pullnumber = substr($5,2,5)
    ind = index($7, "EXTRACT")
    jiraticket = substr($7,ind,12)
    prbase = "https://github.ubs.net/swh/data-collector/pull/";
    jirabase = "https://kwr.ubs.net/jira/browse/"
    print $0
    print prbase pullnumber
    print jirabase jiraticket
    print "-----"
    }' file.txt
