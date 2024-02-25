# Variables

### Pass parameter values via CLI:
`terraform apply -var bucket_name="poos-bucket001"`

### Functions:
`slice(collection, start_index, end_index)`

```
> slice([1,2,3,4], 1, 3)
[
  2,
  3,
]

toset([1,2,3,1,2,3,4,5,3,5])
toset([
  1,
  2,
  3,
  4,
  5,
])

tolist()
tomap()
```


