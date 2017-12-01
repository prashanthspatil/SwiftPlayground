//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Each Block will have
// 1. List of transactions
// 2. Previous hash
// 3. hash of 1 & 2
class Block {
    private var previousHash: Int
    private var transactions: [String] // Usually this would be transaction class object
    private var transactionsHash = 0
    var blockHash: Int {get {return (transactionsHash + previousHash).hashValue}}
    init(previousHash: Int, transactions: [String]) {
        self.previousHash = previousHash
        self.transactions = transactions
        for transaction in self.transactions {
            transactionsHash ^= transaction.hashValue
        }
    }
}

// Block chain: Every block in block chain includes hash value of previous block & hash of current transactions
// This is first/genesis block so previous hash is zero
let genesisTransactions = ["satoshi sent ivan 10 bitcoin", "hal finney sent 10 bitcoins to ivan"]
let genesisBlock = Block(previousHash: 0, transactions: genesisTransactions)
print(genesisBlock.blockHash)

let firstBlockTransactions = ["a->b=$5","b->c=$5","c->d=$5","d->e=$5"]
let firstBlock = Block(previousHash: genesisBlock.blockHash, transactions: firstBlockTransactions)
print(firstBlock.blockHash)

let secondBlockTransactions = ["a->b=$5","b->c=$5","c->d=$5","d->e=$5"]
let secondBlock = Block(previousHash: firstBlock.blockHash, transactions: secondBlockTransactions)
print(secondBlock.blockHash)

// If any node in blockchain tries to alter any past transactions in block chain, end hash would be different when compared to other nodes blockchain (ledgers are distributed not centralized)!. This is reason why blockchain are tamper proof
