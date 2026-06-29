### Overview
Manual API testing of the Fake Store REST API using Postman.

#### Scope
There are 4 main resources need in shopping prototypes:

Products https://fakestoreapi.com/products  </br>
GET /products                               </br>
POST /products                              </br>
GET /products/{id}                          </br>
PUT /products/{id}                          </br>
DELETE /products/{id}                       </br>

Carts https://fakestoreapi.com/carts </br>
GET /carts                                </br>
POST /carts                               </br>
GET /carts/{id}                           </br>
PUT /carts/{id}                           </br>
DELETE /carts/{id}                        </br>

Users https://fakestoreapi.com/users </br>
GET /users                                </br>
POST /users                               </br>
GET /users/{id}                           </br>
PUT /users/{id}                           </br>
DELETE /users/{id}                        </br>

Login Token https://fakestoreapi.com/auth/login </br>
POST /auth/login                          </br>

#### Testing Type
- Functional Testing
- Positive and Negative Testing
- Boundary Value Testing

#### Tools
- Postman
- JSON
- Browser Google Chrome

```bash
FakeStoreAPI/
│   │   ├── Postman_Collection.json
│   │   ├── Test_Cases.md
│   │   ├── Bug_Reports.md
│   │   └── API_Test_Report.md
