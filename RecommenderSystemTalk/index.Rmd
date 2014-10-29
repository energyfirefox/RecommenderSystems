---
title       : Recommender Systems Talk
author      : Anastasiia Kornilova
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Agenda

- General overview
- Algorithms
- Evaluation
- Problems
- Existing tools
- Books and Online courses

---

## Domains of recommendations
<h>Content to Commerce and Beyond

- News, information, “text”
- Products, vendors, bundles
- Matchmaking (other people)
- Sequences (e.g., music playlists)

<h>One particularly interesting property

- New items (e.g., movies, books, …)
- Re-recommend old ones (e.g., groceries, music)

---

## Purposes of Recommendation

- The recommendations themselves (Sales, Information)
- Education of user/customer
- Build a community of users/customers around products or content

![alt text](http://www.in-solve-ncy.co.uk/wp-content/uploads/2011/02/Purpose.jpg)
---

## Whose Opinion?

- “Experts”
- Ordinary “phoaks”
- People like you

![alt text](http://opinion-people.com/sites/opinion-place/files/about_mr1.png)

---

## Personalization Level

- __Generic / Non-Personalized:__ everyone receives same recommendations
- __Demographic:__ matches a target group
- __Ephemeral:__ matches current activity
- __Persistent:__ matches long-term interests

![alt text] (http://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Darts_in_a_dartboard.jpg/283px-Darts_in_a_dartboard.jpg)

---

## Privacy and Trustworthiness

<h> Who knows what about me?

- Personal information revealed
- Identity

<h>Is the recommendation honest?

- Biases built-in by operator
- Vulnerability to external manipulation
- Transparency of “recommenders”

---

## Interfaces

<h> Types of Input

- explicit (Rating, Review, Vote, Like)
- implicit (Click, Purchase, Follow)


<h> Types of Output

- predictions (Estimates of how much you’ll like an item)
- recommnedations (Recommendations are suggestions for items you might like (or might fit what you’re doing)
- filtering
- Organic vs. explicit presentation (Agent/Discussion Interface)

---

## Recommendation Algorithms
1.Non-Personalized Summary Statistics

2.Content-Based Filtering

  + Information Filtering
  + Knowledge-Based

3.Collaborative Filtering

+ User-user
  + Item-item
  + Dimensionality Reduction

4.Others

  + Critique / Interview Based Recommendations
  + Hybrid Techniques

---

## Non-Personalized Summary Stats

- Best-seller
- Most popular
- Trending Hot
- Best-liked
- People who X also Y

---

## Content-Based Filtering

__User Ratings x Item Attributes => Model__

Model applied to new items via attributes

__Alternative:__ knowledge-based (Item attributes form model of item space)

__Example:__ Personalized news feeds

![alt text](http://blog.soton.ac.uk/comp6051-bazinga/files/2013/04/ContentBasedRS.png)

---

## Content-Based Recommenders

<h> Key ideas:

- Model items according to relevant attributes
- Model or reveal user preferences by attribute

<h> Key concept: Keyword Vector

- The universe of possible keywords defines a content space
- Each keyword is a dimension
- Each item has a position in that space; that position defines a vector
- Each user has a taste profile (or more than one) that is also a vector in that space - - The match between user preference and items is measured by how closely the two vectors align

- May want to limit/collapse keyword space (e.g., stem and stop)

---

## Content-Based Recommenders. Tools

- Apache Lucene (Solr, PyLucene, Lucy, Lucene.Net)
- LensKit
- Machine Learning tools (Mahout, Python (with SciPi + NumPy), Matlab/Ocatve, R .. )

---

## Personalized Collaborative Filtering

- Use opinions of others to predict/recommend
- User model – set of ratings
- Item model – set of ratings
- Common core: sparse matrix of ratings

![alt text](http://blog.soton.ac.uk/comp6051-bazinga/files/2013/04/CollaborativeRS.png)

---

## User-User CF

1.Selecting Neighborhoods
  + between 20 and 100 is often used

2.Scoring Items from Neighborhoods
  + average
  + weighted average
  + multiple linear regression

3.Normalizing Data
  + mean centering
  + z-score

4.Computing Similarities
  + Pearson correlation
  + Cosine of user vectors in rating space

---

## Explaining recommendations

[Explaining Collaborative Filtering Recommendations by Herlocker, Konstan, and Riedl (Proc. CSCW 2000)](http://files.grouplens.org/papers/explain-CSCW.pdf)

<h> Key lessons

- Simplicity is key – users didn’t like “correlation,” statistical terms, or being overwhelmed with data
- Simple visualizations work well – histogram, table
- Supporting information valued – historical success, attribute-linked data, associations

<h> One key mistake:

- We didn’t actually measure explanation effectiveness, but rather persuasiveness

---

## Item-item CF

1.Pre-compute item similarities over all pairs of items
  + Usually use cosine similarity between item rating vectors
  + Often normalize user ratings first (subtract user mean, subtract item mean)

2.Look for items similar to those the user likes (purchased, in their basket)

  + For each item to score:
  + Find similar items the user has rated
  + Compute weighted average of user's ratings

---

## Dimensionality Reduction

Ratings matrix is an overfit representation of user tastes and item descriptions

- Leads to problems of synonymy
- Also leads to computational complexity, potentially poorer results
- Ideal would be to have a more compact representation of user tastes and item descriptions – but how ?

Help to discover latent factors.

![alt text](http://smd.princeton.edu/images/help/svd_matrices.gif)

---

## SVD challenges

__Challenge #1:__ missing values

- ‘Impute’ — assume they are a mean
-  Normalize data first — assume they are 0
-  Ignore them

__Challenge #2:__ computational complexity

- FuncSVD
- SVD++

__Challenge #3:__ lack of transparency / explainability

---

## Hybrid Techniques

- Weighting – combine algorithm scores (Can be extended with feature-weighted coefficients)
- Switching – switch algorithms
- Mixed – mix output from diff. algorithms
- Use one algorithm as input to another

![alt text](http://blog.soton.ac.uk/comp6051-bazinga/files/2013/04/HybridRS.png)
---

## Evaluation

*Accuracy and Decision-support metrics
  + MAE, MSE, RMSE, ROC AUC, precision/recall

*Rank metrics

  + Spearman Rank Correlation, Discounted Cumulative Gain, Fraction of Concordant Pairs, Mean Reciprocal Rank

*User and Usage-centered metrics

  + Coverage, user retention, recommendation uptake, satisfaction

*More metrics!

  + Coverage, Diversity, Serendipity

*A Commercial Look

  + Lift, cross-sales, up-sales, conversions

---

## Problems

- Threats
- 'Cold start' problem

![alt text](http://www.caveon.com/blog2/wp-content/uploads/2013/04/Threat.png)
---

## Tools

- LensKit (Java)
- Apache Mahout (Java)
- MyMediaLight (C#/.NET)
- GraphLab (C#, Java)
- REST services (EasyRec, PredictionIO)
- crab (Python)
- mrec (Python)
- recommenderlab (R)

---

## Resources

*Online resources:

+ Coursera: Introduction to Recommender Systems https://www.coursera.org/course/recsys
+ Coursera: Mining Massive Datasets https://www.coursera.org/course/mmds
+ Recommender System Wiki http://www.recsyswiki.com/wiki/Main_Page
+ http://habrahabr.ru/search/?q=Surfingbird

*Books:

+ Handbook of Recommender Systems (Ricci et al., Eds.) 2011, 2014?
+ http://recommenderbook.net/

*Articles:

+ ACM Conference on Recommender Systems
+ ACM Trans. on Information Systems
+ User Modeling and User-Adapted Interaction
+ FunkSVD http://sifter.org/~simon/journal/20061211.html




