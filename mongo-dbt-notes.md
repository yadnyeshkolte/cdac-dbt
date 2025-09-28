```js
db.students.find({age:{$lte:23}},{name:1,age:1}).sort({name:-1})
```

**MongoDB comparison operators**, **logical operators**, and **element operators**

| Operator   | Description                                           | Example Usage                                 |
|------------|-------------------------------------------------------|-----------------------------------------------|
| `$eq`      | Matches values **equal to** a specified value         | `{ age: { $eq: 25 } }`                        |
| `$ne`      | Matches values **not equal to** a specified value     | `{ name: { $ne: "Bob" } }`                    |
| `$gt`      | Matches values **greater than** a specified value     | `{ age: { $gt: 30 } }`                        |
| `$gte`     | Matches values **greater than or equal to** a value   | `{ age: { $gte: 18 } }`                       |
| `$lt`      | Matches values **less than** a specified value        | `{ age: { $lt: 60 } }`                        |
| `$lte`     | Matches values **less than or equal to** a value      | `{ age: { $lte: 23 } }`                       |
| `$in`      | Matches any value in an array                         | `{ laptop: { $in: ["Dell", "HP"] } }`         |
| `$nin`     | Matches values **not in** the specified array         | `{ age: { $nin: [20, 21, 22] } }`             |

| Operator   | Description                                           | Example Usage                                 |
|------------|-------------------------------------------------------|-----------------------------------------------|
| `$and`     | Joins query clauses with logical AND                  | `{ $and: [ { age: { $gt: 20 } }, { age: { $lt: 30 } } ] }` |
| `$or`      | Joins query clauses with logical OR                   | `{ $or: [ { age: 23 }, { name: "Bob" } ] }`   |
| `$not`     | Inverts the effect of a query expression              | `{ age: { $not: { $gt: 30 } } }`              |
| `$nor`     | Matches documents that **fail all** query expressions | `{ $nor: [ { age: 23 }, { name: "Bob" } ] }`  |

| Operator     | Description                                           | Example Usage                                 |
|--------------|-------------------------------------------------------|-----------------------------------------------|
| `$exists`    | Checks if a field is present                          | `{ laptop: { $exists: true } }`               |
| `$type`      | Matches documents with a field of a specific BSON type| `{ age: { $type: "int" } }`                   |


