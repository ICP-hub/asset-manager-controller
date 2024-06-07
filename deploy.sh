set -e

# generate new did file for image_canister_test_backend
./scripts/generate_did.sh

# deploying canister
dfx identity use default
dfx deploy

# change the below hardcoded identity to an identity you want to authorize 
dfx canister call asset_canister_backend authorize '(principal "fufol-ioqx4-l66kz-6mwqk-yul66-wcgic-smbbf-p3sxl-qrfdq-frnbj-pqe")'

# Authorise the canister to upload
TEST_CANISTER=$(dfx canister id image_canister_test_backend)
ASSET_CANISTER=$(dfx canister id asset_canister_backend)
echo "Test Canister ID: $TEST_CANISTER"
echo "Asset Canister ID: $ASSET_CANISTER"
dfx canister call asset_canister_backend authorize '(principal "'$TEST_CANISTER'")'

# upload an asset
dfx canister call image_canister_test_backend upload_asset '(principal "'$ASSET_CANISTER'", record {key="/index.html"; content=vec {255;216;255;225;0;24;69;120;105;102;0;0;73;73;42;0;8;0;0;0;0;0;0;0;0;0;0;0;255;236;0;17;68;117;99;107;121;0;1;0;4;0;0;0;10;0;0;255;225;3;77;104;116;116;112;58;47;47;110;115;46;97;100;111;98;101;46;99;111;109;47;120;97;112;47;49;46;48;47;0;60;63;120;112;97;99;107;101;116;32;98;101;103;105;110;61;34;239;187;191;34;32;105;100;61;34;87;53;77;48;77;112;67;101;104;105;72;122;114;101;83;122;78;84;99;122;107;99;57;100;34;63;62;32;60;120;58;120;109;112;109;101;116;97;32;120;109;108;110;115;58;120;61;34;97;100;111;98;101;58;110;115;58;109;101;116;97;47;34;32;120;58;120;109;112;116;107;61;34;65;100;111;98;101;32;88;77;80;32;67;111;114;101;32;57;46;49;45;99;48;48;50;32;55;57;46;97;54;97;54;51;57;54;56;97;44;32;50;48;50;52;47;48;51;47;48;54;45;49;49;58;53;50;58;48;53;32;32;32;32;32;32;32;32;34;62;32;60;114;100;102;58;82;68;70;32;120;109;108;110;115;58;114;100;102;61;34;104;116;116;112;58;47;47;119;119;119;46;119;51;46;111;114;103;47;49;57;57;57;47;48;50;47;50;50;45;114;100;102;45;115;121;110;116;97;120;45;110;115;35;34;62;32;60;114;100;102;58;68;101;115;99;114;105;112;116;105;111;110;32;114;100;102;58;97;98;111;117;116;61;34;34;32;120;109;108;110;115;58;120;109;112;61;34;104;116;116;112;58;47;47;110;115;46;97;100;111;98;101;46;99;111;109;47;120;97;112;47;49;46;48;47;34;32;120;109;108;110;115;58;120;109;112;77;77;61;34;104;116;116;112;58;47;47;110;115;46;97;100;111;98;101;46;99;111;109;47;120;97;112;47;49;46;48;47;109;109;47;34;32;120;109;108;110;115;58;115;116;82;101;102;61;34;104;116;116;112;58;47;47;110;115;46;97;100;111;98;101;46;99;111;109;47;120;97;112;47;49;46;48;47;115;84;121;112;101;47;82;101;115;111;117;114;99;101;82;101;102;35;34;32;120;109;112;58;67;114;101;97;116;111;114;84;111;111;108;61;34;65;100;111;98;101;32;80;104;111;116;111;115;104;111;112;32;50;53;46;49;48;32;40;50;48;50;52;48;53;49;57;46;109;46;50;54;50;53;32;97;50;52;55;100;54;100;41;32;32;40;77;97;99;105;110;116;111;115;104;41;34;32;120;109;112;77;77;58;73;110;115;116;97;110;99;101;73;68;61;34;120;109;112;46;105;105;100;58;55;57;70;68;49;51;48;51;49;48;56;56;49;49;69;70;65;50;56;50;57;65;67;68;50;66;57;55;52;56;69;66;34;32;120;109;112;77;77;58;68;111;99;117;109;101;110;116;73;68;61;34;120;109;112;46;100;105;100;58;55;57;70;68;49;51;48;52;49;48;56;56;49;49;69;70;65;50;56;50;57;65;67;68;50;66;57;55;52;56;69;66;34;62;32;60;120;109;112;77;77;58;68;101;114;105;118;101;100;70;114;111;109;32;115;116;82;101;102;58;105;110;115;116;97;110;99;101;73;68;61;34;120;109;112;46;105;105;100;58;55;57;70;68;49;51;48;49;49;48;56;56;49;49;69;70;65;50;56;50;57;65;67;68;50;66;57;55;52;56;69;66;34;32;115;116;82;101;102;58;100;111;99;117;109;101;110;116;73;68;61;34;120;109;112;46;100;105;100;58;55;57;70;68;49;51;48;50;49;48;56;56;49;49;69;70;65;50;56;50;57;65;67;68;50;66;57;55;52;56;69;66;34;47;62;32;60;47;114;100;102;58;68;101;115;99;114;105;112;116;105;111;110;62;32;60;47;114;100;102;58;82;68;70;62;32;60;47;120;58;120;109;112;109;101;116;97;62;32;60;63;120;112;97;99;107;101;116;32;101;110;100;61;34;114;34;63;62;255;238;0;14;65;100;111;98;101;0;100;192;0;0;0;1;255;219;0;132;0;20;16;16;25;18;25;39;23;23;39;50;38;31;38;50;46;38;38;38;38;46;62;53;53;53;53;53;62;68;65;65;65;65;65;65;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;1;21;25;25;32;28;32;38;24;24;38;54;38;32;38;54;68;54;43;43;54;68;68;68;66;53;66;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;68;255;192;0;17;8;0;100;0;100;3;1;34;0;2;17;1;3;17;1;255;196;0;133;0;0;2;3;1;1;0;0;0;0;0;0;0;0;0;0;0;0;5;1;3;4;6;2;1;0;3;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;3;2;4;5;16;0;2;1;2;4;5;3;2;3;9;1;0;0;0;0;0;0;1;2;17;3;33;49;18;4;65;81;97;113;5;145;177;19;34;50;129;161;66;240;193;209;225;82;98;114;51;20;36;17;1;1;0;2;1;3;2;7;1;0;0;0;0;0;0;0;0;1;17;2;33;49;18;3;65;50;97;129;193;66;82;4;20;114;255;218;0;12;3;1;0;2;17;3;17;0;63;0;230;128;0;211;32;0;213;180;177;242;75;91;95;76;125;194;240;19;103;111;69;170;75;23;146;44;149;183;47;228;49;181;99;228;117;121;44;205;118;246;110;231;218;168;185;254;217;17;202;178;57;169;217;146;121;20;74;13;51;178;126;54;49;84;167;161;131;113;227;224;177;138;163;31;113;246;57;196;218;122;101;153;232;213;184;176;226;210;161;153;170;58;50;146;229;43;48;128;36;129;146;0;144;0;130;64;0;10;87;4;61;177;99;227;132;97;199;54;44;216;89;249;110;174;75;19;160;132;84;167;208;158;247;209;189;98;253;173;141;88;83;4;241;26;198;10;42;136;199;98;90;99;41;96;146;111;25;100;93;111;115;39;154;82;143;245;91;117;167;116;98;43;133;205;24;239;219;76;219;57;40;38;223;3;21;203;178;151;221;166;221;114;140;223;213;249;12;225;7;147;134;140;87;97;77;213;138;124;208;239;203;39;27;82;114;88;161;53;232;202;42;58;213;42;181;46;198;181;79;120;164;0;10;36;128;36;0;32;0;148;156;154;75;54;0;227;197;90;211;7;55;156;178;28;88;133;100;202;54;150;52;66;49;92;16;195;111;28;127;7;238;70;243;84;157;19;111;107;27;209;164;213;105;38;215;67;212;118;138;204;181;91;109;115;235;220;179;107;42;169;46;82;104;178;228;184;112;9;120;87;28;171;191;39;130;89;153;46;120;203;119;21;103;89;55;157;120;154;175;213;73;83;30;133;173;209;15;160;193;70;230;196;101;166;220;254;220;153;205;239;111;255;0;209;117;201;125;171;233;143;100;59;243;59;159;142;46;41;210;82;193;118;226;115;134;181;158;169;249;47;218;0;0;218;72;0;0;0;215;227;237;124;151;151;67;24;251;194;216;164;29;199;196;91;92;67;157;78;54;241;197;244;162;253;230;171;42;146;69;59;85;130;124;220;153;162;10;141;62;164;84;97;177;119;78;234;245;170;254;170;250;170;163;95;205;73;252;114;139;165;43;25;54;180;190;157;251;136;252;211;150;207;121;111;117;15;182;73;70;99;203;82;142;230;10;113;117;76;61;85;151;51;145;118;74;218;212;213;41;213;30;99;114;87;33;169;170;87;131;204;153;109;146;197;208;207;184;155;208;227;30;9;226;58;124;57;175;43;125;94;220;61;56;168;253;63;196;194;11;32;45;38;28;150;230;229;0;0;50;0;0;35;121;165;112;58;219;22;254;27;42;61;14;111;99;111;228;191;8;245;175;161;212;79;22;151;224;79;122;222;177;190;194;164;87;72;251;158;227;149;121;52;11;4;207;48;198;222;60;73;180;95;230;236;171;182;232;249;123;25;188;100;231;110;41;197;209;60;208;199;201;170;217;148;249;39;249;152;188;82;215;101;87;128;85;53;232;103;55;39;28;89;68;225;72;208;211;76;15;19;141;64;101;198;111;54;207;111;113;174;15;20;103;58;47;47;183;213;24;205;118;98;23;108;182;183;142;91;254;123;190;189;254;63;156;86;65;45;83;50;13;184;236;178;226;241;64;0;8;24;120;187;84;184;231;201;83;212;121;99;234;184;170;45;241;209;164;107;205;141;182;177;250;155;33;181;205;118;249;117;154;237;102;179;17;190;110;145;97;93;48;167;68;120;184;240;72;38;248;115;116;244;50;130;143;43;61;59;73;245;210;189;76;222;42;18;133;173;84;120;244;45;243;47;255;0;51;95;221;17;158;202;26;44;194;60;162;141;107;51;69;219;17;70;169;47;210;253;9;80;185;42;210;46;131;10;176;121;20;236;103;188;167;113;176;157;216;61;77;36;147;116;206;167;41;56;227;83;191;106;167;15;184;183;162;114;142;84;147;67;198;30;151;232;237;221;55;214;252;43;43;138;121;230;120;149;164;95;166;184;172;194;149;93;134;238;219;199;174;222;233;43;47;198;6;128;4;63;151;197;248;195;61;149;40;187;13;118;180;210;249;212;0;133;234;243;252;254;250;186;85;212;187;158;21;117;198;185;99;235;80;3;40;168;242;95;234;150;172;181;161;213;170;105;84;228;189;128;10;233;213;141;186;71;190;100;188;128;10;166;134;114;62;71;79;253;23;63;200;0;30;135;232;251;246;255;0;63;86;21;74;158;112;171;0;19;216;87;236;0;2;97;255;217;}; content_type="png"; content_encoding="etc";})'

# get uploaded asset
# echo $(dfx canister call image_canister_test_backend get_asset '(principal "'$ASSET_CANISTER'", record {key="upload/1.png"; accept_encodings= vec {"etc"}})')
echo $(dfx canister call asset_canister_backend get '(record {key="upload/1.png"; accept_encodings= vec {"etc"}})' --identity default)