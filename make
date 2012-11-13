#!/bin/bash

cd /mnt/documents-smb/Alan\'s\ Server/Projects/Software/Web/Mogul\ Frameworks/Mogul\ MVC/Framework/
tar cfvz Mogul.tar.gz application/ framework/ .htaccess index.php
rm /mnt/documents-smb/Alan\'s\ Server/Projects/Software/Web/Mogul\ Frameworks/Mogul\ MVC/Tools/resource/*
mv Mogul.tar.gz /mnt/documents-smb/Alan\'s\ Server/Projects/Software/Web/Mogul\ Frameworks/Mogul\ MVC/Tools/resource/