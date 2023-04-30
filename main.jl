using Cascadia
using HTTP
using Gumbo

const baseURL = "https://kathmandupost.com"

html_response = parsehtml(String(HTTP.get("$baseURL")))

# get the date
date_selector = sel".blocktop-date"
date = eachmatch(date_selector, html_response.root)

print("Headlines for:")
# print the date
println(date[1].children[1])

article_selector = sel".article-image"

# select all tags with class article-image
articles = eachmatch(article_selector, html_response.root)

# selector for headline of news.
article_header_selector = sel".article-image h3 a"
# get the headline
header = eachmatch(article_header_selector, html_response.root) 
# get the author of the news
article_author_selector = sel".article-author a" 

author_anchor = eachmatch(article_author_selector, html_response.root)

for headline in header
    link = getattr(headline, "href")
    # print the headlines           
    print(headline.children[1])
    print(": ")
    println("$baseURL$link")
end

