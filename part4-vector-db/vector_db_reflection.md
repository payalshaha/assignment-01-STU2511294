## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts using natural language questions. Keyword search works by matching exact words or phrases in a document, which means it may miss relevant information if the wording in the contract is different from the user’s query. For example, if a lawyer searches for “termination clauses,” the contract might use different wording such as “agreement cancellation terms” or “conditions for ending the contract.” A keyword-based system may fail to retrieve these sections because the exact words do not match.

Vector databases solve this limitation by using embeddings, which represent text as numerical vectors that capture semantic meaning rather than exact wording. When the 500-page contracts are stored in the system, the text can be split into smaller sections or paragraphs and converted into embeddings using a language model. These embeddings are then stored in a vector database.

When a lawyer asks a question in plain English, the system converts the query into an embedding and compares it with the stored embeddings using similarity measures such as cosine similarity. The vector database quickly retrieves the sections of the contract that are semantically similar to the query. This allows the system to find relevant information even if the wording is different.

In this system, the vector database acts as a semantic search engine that enables intelligent document retrieval. It improves accuracy, reduces manual searching, and allows lawyers to quickly locate important clauses within large contracts.

