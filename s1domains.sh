#!/bin/bash

clear

function logoMAIN() {

echo -e """\n
 ____        _     _   _             _
/ ___| _   _| |__ | | | |_   _ _ __ | |_
\___ \| | | | '_ \| |_| | | | | '_ \| __|
___) | |_| | |_) |  _  | |_| | | | | |_
|____/ \__,_|_.__/|_| |_|\__,_|_| |_|\__|

	Author: Hassan Yusufzai - @splint3r7
	GitHub: https://github.com/splint3r7

	\n"""
}

if [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then

	logoMAIN

	echo -e "Note: Make sure to run install.sh before running \n"
	echo -e "[+] Useage: bash s1domains.sh --domain domain.com -output /path/folder/ \n"
	echo -e "[+] bash s1domains.sh -d domain.com -o /path/folder/"
	exit 1
fi

# Colors

RED='\033[0;31m'
BWhite='\033[1;37m'
GREEN="\033[0;32m"
RESET="\033[0m"
NC='\033[0m'
YELLO="\033[0;33m"
Purple='\033[0;35m'
IRed='\033[0;91m' 
Cyan='\033[0;36m'

# QUOTES :D

QUOTES() {

QUOTES=(

	"Activating 1337 mode!"
	"Never underestimate the determination of a kid who is time-rich and cash-poor."
	"Human Stupidity , that’s why Hackers always win."
    "Hacking is less about technology for me and more about religion."
    "Never tell everything you know…!"
    "Never gonna give you up."
	"Bounty pls."
	"Sleep is for the weak."
	"Haxor 1337 Detected"
	"Grab a cuppa!"
	"I am talking about the guys that no one knows about."
	"I am 100 percent natural."
	"A bug is never just a mistake. It represents something bigger. An error of thinking that makes you who you are."
	"You hack people. I hack time."
	"I hope you don't screw like you type."
	"Hack the planet!"
    "Happy Hunting!"
    "The Quiter you become the more you are able to hear"
    "yeyy, I earned $1500 for my submisson on @H1 & @BugCrowd. xD"
    "I eat CORS in breakfast"
    "Don't hate the hacker, hate the code"
    "Hackerman detected."

)

rand=$[RANDOM % ${#QUOTES[@]}]
printf "\n${YELLO}\xF0\x9F\x9A\x80${NC} ${QUOTES[$rand]} \xF0\x9F\x98\x81\\n"
echo

}

# Clean Output folder :)

cd /root/
#rm -rf /root/results/*.txt

mainPATH=$(pwd)/

bar="---------------------------------------"

function scanSublist3r() {
	echo -e "\n$bar\n\tRunning Sublist3r\n$bar\n"
	cd $mainPATH
	cd Sublist3r/
	#source ./env/bin/activate
	python3 sublist3r.py -v -t 100 -o $sublist3rPATH -d $HOST
}

function scanSubfinder() {
	echo -e "\n$bar\n\tRunning Subfinder\n$bar\n"
	cd $mainPATH
	subfinder -o $subfinderPATH -t 100 -d $HOST 
}

function scanAmass() {
	echo -e "\n$bar\n\tRunning Amass\n$bar\n"
	cd $mainPATH
	amass enum -active -o $amassPATH -d $HOST
}

function scanOneForAll() {
	echo -e "\n$bar\n\tRunning OneForAll\n$bar\n"
	cd $mainPATH
	cd OneForAll/
	#source ./env/bin/activate
	python3 oneforall.py --target $HOST run --path=$oneForAllPATH
    cd $outputPATH
	rm -rf *.csv
	mv $outputPATH/all_subdomain_result* oneforall.txt
}

function scanAssetsFinder() {
	echo -e "\n$bar\n\tRunning Assets finder\n$bar\n"
	cd $mainPATH
	assetfinder --subs-only $HOST | tee $assetfinderPATH
}

function scanFindomain() {
	echo -e "\n$bar\n\tRunning Findomain\n$bar\n"
	cd $mainPATH
	findomain -t $HOST -u $finddomainPATH

}

function scanPuredns () {
	echo -e "\n$bar\n\tRunning PureDNS\n$bar\n"
	cd $mainPATH
	puredns bruteforce /root/wordlists/best-dns-wordlist.txt $HOST --wildcard-batch 1000000 -r /root/wordlists/resolvers.txt | tee $purednsPATH
}

function scanScilla () {
	scillaPATH
	echo -e "\n$bar\n\tRunning Scilla\n$bar\n"
	cd $mainPATH

}

function scanGAU () {
	echo -e "\n$bar\n\tRunning GAU\n$bar\n"
	cd $mainPATH
	gau --subs $HOST | unfurl -u domains | tee $gauPATH
}

function scanGitHubSubdomains () {
	echo -e "\n$bar\n\tRunning Github-Subdomains\n$bar\n"
	cd $mainPATH
	cd github-search/
	python3 github-subdomains.py -d $HOST | tee $githubsearchPATH
}

function sortResults() {
	cd $mainPATH
	cd $outputPATH
	cat *.txt | sed "s/www.//" | sed "s/nwww.//" | sort | uniq > results.txt

	echo -e "\n$bar\nFinal Results:\n$bar\n"
	echo -e "[#] Subdomains Count: $(wc -l < results.txt)\n"

	cat results.txt
}

function resolveSubdomains() {
	cd /root/massdns/
	cat $outputPATH/results.txt | /root/massdns/bin/massdns -r /root/massdns/lists/resolvers.txt --quiet -t A -o S -w /root/massdns/results-resolved.txt

	echo -e "\n$bar\nResolved Results:\n$bar\n"
	echo -e "[#] Resolved Count: $(wc -l < /root/massdns/results-resolved.txt)\n"
	cat /root/massdns/results-resolved.txt
}

if [[ $1 == "--domain" ]] || [[ $1 == "-d" ]]; then

	logoMAIN

	HOST=$2

	if [[ $3 == "--output" ]] || [[ $3 == "-o" ]]; then

		outputPATH=$4/subhunterRESULTS/
		rm -rf $outputPATH/*.txt

		mkdir -p $outputPATH/$HOST

		sublist3rPATH=$outputPATH/$HOST-sublist3r.txt
		subfinderPATH=$outputPATH/$HOST-subfinder.txt
		amassPATH=$outputPATH/$HOST-amass.txt
		oneForAllPATH=$outputPATH/
		assetfinderPATH=$outputPATH/$HOST-assetfinder.txt
		finddomainPATH=$outputPATH/$HOST-findomain.txt
		purednsPATH=$outputPATH/$HOST-puredns.txt
		scillaPATH=$outputPATH/$HOST-scilla.txt
		gauPATH=$outputPATH/$HOST-gau.txt
		githubsearchPATH=$outputPATH/$HOST-githubsearch.txt
	
		scanSublist3r $HOST
		scanSubfinder $HOST
		#scanAmass $HOST
		#scanOneForAll $HOST
		scanAssetsFinder $HOST
		scanFindomain $HOST
		#scanPuredns $HOST
		scanGAU $HOST
		scanGitHubSubdomains $HOST


		sortResults
		resolveSubdomains

		QUOTES

		mv $outputPATH/results.txt $outputPATH/$HOST/$HOST.txt
		rm -rf $outputPATH/*.txt

	fi
fi
