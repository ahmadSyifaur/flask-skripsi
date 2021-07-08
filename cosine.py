# query= "arial helvetica roboto lato"

# doc1 = "TimesNewRoman Arial"

# doc2 = "TimesNewRoman HaasGrotTextRWeb HelveticaNeue Helvetica Arial SansSerif"

# doc3 = "TimesNewRoman lato Roboto HelveticaNeue Helvetica Tahoma Arial PingFangSC MicrosoftYaHei NotoSansSemiBold sansserif NotoSansMedium"

# documents = [doc1, doc2, doc3]

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
# from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd

vectorizer = TfidfVectorizer()
# documents=[]
# vectorizer = CountVectorizer()
# Xq = vectorizer.fit_transform([query])
# X = vectorizer.fit_transform(documents)
# print(vectorizer.get_feature_names())

# print(X.shape)

# doc_term_matrix = X.todense()
# df = pd.DataFrame(doc_term_matrix, 
#                   columns=vectorizer.get_feature_names(), 
#                   index=['doc1', 'doc2', 'doc3'])
# df


# print(cosine_similarity(df, df))
# def get_font_web_documents(data,query):
#     # documents = dict.fromkeys(data[1].keys(),0)
#     X = vectorizer.fit_transform(data)
#     results=get_tf_idf_query_similarity(vectorizer,X,query)
#     return results

def get_tf_idf_query_similarity(docs, query):
    vectorizer = TfidfVectorizer()
    docs_tfidf = vectorizer.fit_transform(docs)
    query_tfidf = vectorizer.transform([query])
    results = cosine_similarity(query_tfidf, docs_tfidf).flatten()
    # df = pd.DataFrame(results,  
    #                   index=['doc1', 'doc2', 'doc3'])
    # # df
    return results

# result= get_tf_idf_query_similarity(vectorizer,X,query,documents)
# print(result)