const AWS = require('aws-sdk')
const docClient = new AWS.DynamoDB.DocumentClient()

function createOrder(request) {
  if (!request || !request.pizza || !request.address)
    throw new Error(`To order pizza please provide pizza type and address where pizza should be delivered ${request}`);

  return docClient.put({
    TableName: 'pizza-orders',
    Item: {
      orderId: 'some-id',
      pizza: request.pizza,
      address: request.address,
      orderStatus: 'pending'
    }
  })
    .promise()
    .then((res) => {
      console.log('Order is saved!', res)
      return res
    })
    .catch((saveError) => {
      console.log(`Oops, order is not saved :(`, saveError)
      throw saveError
    })
}

module.exports = createOrder
