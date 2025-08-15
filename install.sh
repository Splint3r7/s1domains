apt-get update -y && \
	apt-get install -y wget python3 python3-pip unzip && \
	export PATH="${PATH}:/root/bins/"

cd && \
	mkdir -p /root/Sublist3r && cd /root/Sublist3r && \
	wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/sublist3r.py -O sub.py && \
	sed 's/from subbrute import subbrute//i' sub.py > sublist3r.py && \
	pip3 install argparse dnspython requests idna --break-system-packages && \
	rm -fv sub.py

cd && \
	mkdir -p OneForAll && cd OneForAll && \
	wget https://github.com/shmilylty/OneForAll/archive/v0.3.0.tar.gz && \
	tar -xvf v0.3.0.tar.gz && \
	rm -rfv v0.3.0.tar.gz && \
	mv OneForAll-0.3.0/* . && rm -rfv OneForAll-0.3.0 && \
	pip3 install -r /root/OneForAll/requirements.txt --break-system-packages

cd && \
	mkdir -p massdns && cd massdns && \
	wget https://github.com/blechschmidt/massdns/archive/v0.3.tar.gz && \
	tar -xvf v0.3.tar.gz && \
	rm -rfv v0.3.tar.gz && \
	mv massdns-0.3/* . && \
	rm -rfv massdns-0.3 && \
	make && \
	cp bin/massdns /usr/bin/massdns && chmod +x /usr/bin/massdns

cd && \
	mkdir -p bins && cd bins && \
	wget https://github.com/projectdiscovery/subfinder/releases/download/v2.6.4/subfinder_2.6.4_linux_amd64.zip && \
 	unzip subfinder_2.6.4_linux_amd64.zip && \
	wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz && \
	wget https://github.com/Findomain/Findomain/releases/download/9.0.4/findomain-linux.zip && \
 	wget https://github.com/tomnomnom/unfurl/releases/download/v0.4.3/unfurl-linux-amd64-0.4.3.tgz && \
	wget https://github.com/d3mondev/puredns/releases/download/v2.1.1/puredns-Linux-amd64.tgz && \
	wget https://github.com/lc/gau/releases/download/v2.2.1/gau_2.2.1_linux_amd64.tar.gz && \
	wget https://github.com/owasp-amass/amass/releases/download/v4.1.0/amass_Linux_amd64.zip && \
	unzip amass_Linux_amd64.zip && \
	mv amass_Linux_amd64/amass /usr/bin && \
	tar xzf gau_2.2.1_linux_amd64.tar.gz && \
	tar xzf puredns-Linux-amd64.tgz && \
	tar xzf unfurl-linux-amd64-0.4.3.tgz && \
	sudo mv unfurl /usr/bin/ && \
	sudo mv puredns /usr/bin/ && \
	sudo mv gau /usr/bin/ && \
	unzip findomain-linux.zip && \
	cp subfinder /usr/bin/ && chmod +x /usr/bin/subfinder && \
	cp findomain /usr/bin/ && chmod +x /usr/bin/findomain

cd && \
	cd bins && \
	tar -xvf assetfinder-linux-amd64-0.1.0.tgz && \
 	cp assetfinder /usr/bin/ && chmod +x /usr/bin/assetfinder && \
  	assetfinder -h

cd && \
	cd bins && \
	rm -rfv LICENSE README.md && \
	rm -rfv *.tgz *.zip *.tar.gz && \
	mv amass_linux_amd64/amass . && \
	rm -rfv amass_linux_amd64


cd && \
	go install github.com/d3mondev/puredns/v2@latest && \
	cp ~/go/bin/puredns /usr/bin && chmod +x /usr/bin/puredns
	
	# for google cloud shell
	# go install github.com/d3mondev/puredns/v2@latest && \
        # cp /root/gopath/bin/puredns /usr/bin && chmod +x /usr/bin/puredns
	
cd && \
	git clone https://github.com/edoardottt/scilla.git && cd scilla/  && \
	go get && make linux && \
	cp ~/go/bin/scilla /usr/bin/ && chmod +x /usr/bin/scilla

# Wordlists

cd && \
	mkdir -p ~/wordlists/ && cd ~/wordlists/  && \
	wget https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt -O 2m-subdomains.txt && \
	wget https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt -O resolvers.txt && \
	wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt -O best-dns-wordlist.txt && \
	wget https://download1980.mediafire.com/10z93r9vfjkg/sffh4ie1j96iurb/best_dns_wordlist.txt -O best_dns_wordlist_splint3r7.txt

 
cd && \
	go install github.com/lc/gau/v2/cmd/gau@latest && \
	go install github.com/tomnomnom/unfurl@master && \
	cp ~/go/bin/gau /usr/bin/gau && chmod +x /usr/bin/gau && \
	cp ~/go/bin/unfurl /usr/bin/unfurl && chmod +x /usr/bin/unfurl

cd && \
	git clone --recursive https://github.com/screetsec/Sudomy.git && \
	cd Sudomy && \
	python3 -m pip install -r requirements.txt && \
	cp sudomy /usr/bin/sudomy && chmod +x /usr/bin/sudomy


cd && \
	mkdir -p github-search && cd /root/github-search && \
	wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py -O github-subdomains.py && \
	wget https://raw.githubusercontent.com/gwen001/github-search/master/requirements.txt && \
	pip3 install -r requirements.txt --break-system-packages && \
	echo "Paste_your_token_here" > .tokens

