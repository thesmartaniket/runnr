
$option=Read-Host -Prompt "enter your option install[I] or remove [r] [I/r]:"
if( ($option -eq "i" )-or($option -eq "")){

    if(Test-Path -Path "dist"){
        Write-Host "`nfolder already exists ....`n"

        $choice=Read-Host -Prompt "do you want to install from scratch(re) or override installation (o) [RE/o] :"

        if(($choice -eq "re") -or ($choice -eq "RE") -or ($choice -eq "Re") -or ($choice -eq "rE") -or ($choice -eq "")){
            
            # full reinstall condition

            Write-Host "starting Reinstallation... "
            Write-Host "removing folder ./dist"
            Invoke-Expression "rmdir dist"
            Write-Host "removing complete...."


            Write-Host "starting build...."
            Invoke-Expression "python -m build"
            Write-Host "Installation complete..... Enjoy!!!"
            Invoke-Expression "pip install .\dist\runnr-0.1.2b1-py3-none-any.whl --force-reinstall"

        }else{

            # override condition
            Write-Host "starting build...."
            Invoke-Expression "python -m build"
            Write-Host "`nInstallation complete..... Enjoy!!!`n"
        }
    }else{
        # when dist folder does not exist 
        Invoke-Expression "python -m build"
        Write-Host "Installation complete..... Enjoy!!!`n"

    }
    
}elseif (($option -eq "r")) {
    # to remove the dist folder
    
    Write-Host "preapring to remove folder ./dist `n"
    Invoke-Expression "rmdir dist"
    Write-Host "Removing complete....`n"

}else{
    Write-Host "try giving appropriate options...`n"
}
