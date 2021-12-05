

```
配置文件路径：/etc/Xray 配置文件详见：配置文件说明

bash <(curl -Ls https://raw.githubusercontent.com/xcode75/XManager/dockerfiles/install.sh)

```


申请ssl证书文件 

### 一个域名 -d uk.xxx.com  多域名 -d uk1.xxx.com -d uk2.xxx.com

```
bash /root/.acme.sh/acme.sh --set-default-ca  --server  letsencrypt --issue -d uk.xxx.com --standalone --force

bash /root/.acme.sh/acme.sh --installcert -d uk.xxx.com --fullchainpath /etc/Xray/uk.xxx.com.crt --keypath /etc/Xray/uk.xxx.com.key

```
