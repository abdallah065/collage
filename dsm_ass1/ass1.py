from sklearn.datasets import fetch_20newsgroups
import re

# Load the 20 Newsgroups dataset
newsgroups = fetch_20newsgroups(subset='train')

# Access the data (text) and target (newsgroup)
data = newsgroups.data
target = newsgroups.target

# Example of possible benefits of scraping
print("Possible Benefits of Scraping:")
print("- Extracting email addresses or URLs from the text.")
print("- Identifying the most frequent words or phrases used in each newsgroup.")
print("- Analyzing the sentiment expressed in the newsgroup posts.")
print("- Classifying the newsgroup posts into different categories.")

# Perform scraping on the data
def scrape_data(text):
    # Extract URLs
    urls = re.findall(r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', text)
    # Extract email addresses
    emails = re.findall(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}', text)
    return urls, emails

# Example usage
urls, emails = scrape_data(data[0])
print("\nURLs found:", urls)
print("Emails found:", emails)