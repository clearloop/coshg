# Coshg

# Cosmos Guide
## Application Goals

> A blockchain application is just a replicated deterministic state machine, As a developer, you just have to define the state machine (i.e. what the state, a starting state and messages that trigger state transitions), and Tendermint will handle replication over the network for you.

+ `auth`: This module defines accounts and fees and gives access to these functionalities to the rest of your application.
+ `bank`: This module enables the application to create and manage tokens and token balances.
+ `nameservice`: This module does not exist yet! It will handle the core logic for the nameservice application you are building. It is the main piece of software you have to work on to build your application.

### State

The state represents your application at a given moment. __It tells how much token each account possesses, what are the owners and price of each name, and to what value each name resolves to.__

The state of tokens and accounts is defined by the auth and bank modules, which means you don't have to concern yourself with it for now. __What you need to do is define the part of the state that relates specifically to your nameservice module.__

__In the SDK, everything is stored in one store called the multistore.__ Any number of key/value stores (called KVStores in the Cosmos SDK) can be created in this multistore. For this application, we will use one store to map names to its respective whois, a struct that holds a name's value, owner, and price.

### Messages
__Messages are contained in transactions.(store?)__ They trigger state transitions. Each module defines a list of messages and how to handle them. Here are the messages you need to implement the desired functionality for your nameservice application:

+ `MsgSetName`: This message allows name owners to set a value for a given name in the nameStore.
+ `MsgBuyName`: This message allows accounts to buy a name and become its owner in the ownerStore.

When someone buys a name, they are required to pay the previous owner of the name a price higher than the price the previous owner paid for it. If a name does not have a previous owner yet, they must burn a MinPrice amount.

When a transaction (included in a block) reaches a Tendermint node, it is passed to the application via the ABCI and decoded to get the message. The message is then routed to the appropriate module and handled there according to the logic defined in the Handler. If the state needs to be updated, the Handler calls the Keeper to perform the update. You will learn more about these concepts in the next steps of this tutorial.


