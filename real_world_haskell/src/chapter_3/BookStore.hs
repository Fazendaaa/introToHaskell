-- BookStore.hs
module BookStore where
    data BookInfo = Book Int String [String] deriving (Show)
    data MagazineInfo = Magazine Int String [String] deriving (Show)

    myInfo :: BookInfo
    myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]
 
    type CustomerID = Int
    type ReviewBoody = String
    
    data BookReview = BookReview BookInfo CustomerID String
    data BetterReview = BetterReview BookInfo CustomerID ReviewBoody

    -- I've changed the BookReview from one intance to an array of it; for me it makes more sense.
    type BookRecord = (BookInfo, [BookReview])

    type CardHolder = String
    type CardNumber = String
    type Address = [String]

    data BillingInfo = CreditCard CardNumber CardHolder Address
                     | CashOnDelivery
                     | Invoice CustomerID
                     deriving (Show)

    data Customer = Customer {
        customerID :: CustomerID,
        customerName :: String,
        customerAddress :: Address    
    } deriving (Show)

    customer1 = Customer {
                    customerID = 2345678,
                    customerAddress = [ "13465 Disk Drive", "Milipitas, CA, USA"],
                    customerName = "John Doe"
                }
