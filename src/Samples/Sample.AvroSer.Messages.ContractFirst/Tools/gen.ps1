﻿#
# SlimMessageBus
# Small script to help with Avro *.avdl to C# classes generation.
# Feel free to copy and use with your projects.
#

$FILE = 'avro-tools.jar'
$VERSION = '1.9.1'

# download the avro tools (if havent done so already)
if(!(Test-Path -Path $FILE -PathType leaf)) 
{
	wget "http://apache.mirrors.tworzy.net/avro/avro-$VERSION/java/avro-tools-$VERSION.jar" -outfile $FILE
}

Remove-Item –path ../Contract-Protocol/* -Filter *.avpr
# generate avro protocol from avro IDL
& java -jar $FILE idl ../Contract-IDL/SampleContract.avdl ../Contract-Protocol/SampleContract.avpr

# generate C# classes from acro protocol
avrogen -p ../Contract-Protocol/SampleContract.avpr ../

