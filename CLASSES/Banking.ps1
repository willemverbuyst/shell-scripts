class BankAccount {
    [string]$Name
    [int]$Balance
    [void]Deposit([int]$amount) {
        $this.Balance += $amount
    }
    [void]Withdraw([int]$amount) {
        if ($this.Balance - $amount -gt 0) {
            $this.Balance = $this.Balance - $amount
        }
    }
}

$AccountOne = [BankAccount]::new()
$AccountTwo = [BankAccount]::new()

$AccountOne.Name = "Savings"
$AccountOne.Balance = 1000

$AccountTwo.Name = 'Current'
$AccountTwo.Balance = 500

$AccountOne.Deposit(300)
$AccountTwo.Deposit(500)

$AccountOne.Withdraw(500)
$AccountTwo.Withdraw(3000)

Write-Output $AccountOne
Write-Output $AccountTwo