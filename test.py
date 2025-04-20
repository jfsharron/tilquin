from quiffen import Qif
import datetime
import decimal

def read_qdf(file_path):
    """
    Reads a QDF file and prints its contents.

    Args:
        file_path (str): The path to the QDF file.
    """
    #file_path = '/data/share/tilquin/FINANCES_20061126_201104231_20160218-desktop202.QDF'
    try:
        with open(file_path, 'r') as file:
            qif_data = Qif.parse(file)

        # Print accounts
        print("Accounts:")
        for account_name, account in qif_data.accounts.items():
            print(f"  {account_name}:")
            print(f"    Description: {account.desc}")
            print("    Transactions:")
            for transaction_type, transactions in account.transactions.items():
                print(f"      Type: {transaction_type}")
                for transaction in transactions:
                    print(f"        Date: {transaction.date}")
                    print(f"        Amount: {transaction.amount}")
                    print(f"        Payee: {transaction.payee}")
                    print(f"        Category: {transaction.category}")
                    if transaction.splits:
                        print("        Splits:")
                        for split in transaction.splits:
                            print(f"          Category: {split.category}, Amount: {split.amount}")
                    print("-" * 30)

        # Print categories
        print("\nCategories:")
        for category_name, category in qif_data.categories.items():
            print(f"  {category_name}:")
            print(f"    Type: {'Expense' if category.expense else 'Income'}")
            print(f"    Hierarchy: {category.hierarchy}")
            print("-" * 30)

    except FileNotFoundError:
        print(f"Error: File not found: {file_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    file_path = "your_file.qdf"  # Replace with the actual path to your QDF file
    read_qdf(file_path)