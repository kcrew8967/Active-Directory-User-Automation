# ==============================================================================
# Script Name: Import-NewHires.ps1
# Description: Automates bulk Active Directory user creation from a CSV file.
#              Designed to streamline Helpdesk onboarding tickets.
# ==============================================================================

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the path to the HR onboarding CSV file
$csvPath = ".\new_hires.csv"

# Read the CSV data
$users = Import-Csv -Path $csvPath

# Loop through each row in the CSV and create the user account
foreach ($user in $users) {
    # Construct the UserPrincipalName (e.g., jsmith@corporate.local)
    $upn = "$($user.Username)@corporate.local"
    
    # Convert the plain text temporary password into a SecureString
    $securePassword = ConvertTo-SecureString $user.TempPassword -AsPlainText -Force
    
    try {
        # Create the new Active Directory user
        New-ADUser -Name $user.FullName `
                   -GivenName $user.FirstName `
                   -Surname $user.LastName `
                   -SamAccountName $user.Username `
                   -UserPrincipalName $upn `
                   -Department $user.Department `
                   -AccountPassword $securePassword `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true
                   
        Write-Host "[SUCCESS] Created AD Account for: $($user.FullName) in $($user.Department)" -ForegroundColor Green
    }
    catch {
        Write-Host "[ERROR] Failed to create account for $($user.FullName). User may already exist." -ForegroundColor Red
    }
}

Write-Host "Bulk user import completed." -ForegroundColor Cyan
