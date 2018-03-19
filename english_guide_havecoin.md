## Guide for HAVECOIN
1.  Download wallet from official : http://www.havecoin.co/ or https://github.com/scryclip/havecoin/releases
2. Open your Havecoin wallet and go to the “Receive” tab. Your wallet may still be synchronising or completed.
3. Right click on the address bar and copy your address of your wallet. Also copy & paste it to your notepad.
4. Pay over 2500HAV (exactly) from your exchange to your copied wallet address.The 2500 balance will ONLY show in your balance AFTER the wallet has synchronised completely.
5. Once the “Transaction” shows up in the transaction list wait for at least 1 confirmation.
6. Go to your **“Help”** tab and select **“Debug windows”** to open **"Debug console"**.
7. Type ``masternode genkey``” and hit enter. This will generate your **"MasterNode private key"**. Copy & paste to notepad.
8. Now type ``masternode outputs`` and hit enter. If the transaction of 2500 started to confirm, you will get a **“txhash”** and **“txindex”** (0 or 1). Copy and paste them to your notepad.
9. Login VPS and use script and run :

```bash
wget  https://raw.githubusercontent.com/secrectvn/masternode/master/coin/havecoin.sh && chmod +x havecoin.sh && ./havecoin.sh
```

10. Input **"MasterNode private key"**, **“txhash”** , **“txindex”**  
![Demo Havecoin V1.0 ](https://raw.githubusercontent.com/secrectvn/masternode/master/img/demo_havecoin_v10.png)
11. reboot VPS  


#### I'm not good at English, hoping for sympathy
#### If you find it useful to you, donate favor to me, thanks you !
#### You need a script to install another masternode, please send a request to the discord group I will support !


### Havecoin Wallet
> 
### Gajan Coin
> 
### Discord 
> https://discord.gg/Axtdgq3
