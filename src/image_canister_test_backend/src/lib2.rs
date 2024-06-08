use std::rc::Rc;

use candid::{CandidType, Nat, Principal};
use ic_cdk::api::call::call;
use ic_cdk_macros::*;
use serde::{Deserialize, Serialize};
// use ic_certified_assets::types::StoreArg;
use ic_certified_assets::types::Key;
use serde_bytes::ByteBuf;
use ic_cdk::export_candid;

// #[derive(Clone, Debug, CandidType, Deserialize)]
// pub struct RcBytes(Rc<ByteBuf>);

#[derive(Clone, Debug, CandidType, Deserialize)]
pub struct StoreArg {
    pub key: Key,
    pub content_type: String,
    pub content_encoding: String,
    pub content: ByteBuf,
    pub sha256: Option<ByteBuf>,
}

#[derive(Clone, Debug, CandidType, Deserialize)]
pub struct StoreConfig {
    /**
     * File name
     * @default File object name or name in file path
     */
    fileName: Option<String>,
    /**
     * File path that file will be uploaded to
     * @default '/'
     */
    path: Option<String>,
    /**
     * File content type
     * @default File/Blob object type or type from file name extension
     */
    contentType: Option<String>,
    
}
#[derive(Clone, Debug, CandidType, Deserialize)]
pub struct StoreBytesArgs {
    bytes: Vec<u8>,
    config: StoreConfig
}

#[derive(Clone, Debug, CandidType, Deserialize)]
pub struct GetArg {
    pub key: Key,
    pub accept_encodings: Vec<String>,
}

// #[derive(Clone, Debug, CandidType, Deserialize)]pub struct EncodedAsset {
//     pub content: RcBytes,
//     pub content_type: String,
//     pub content_encoding: String,
//     pub total_length: Nat,
//     pub sha256: Option<ByteBuf>,
// }

#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

#[update]
async fn upload_asset(asset_canister_id: Principal, arg: StoreBytesArgs) -> String {
    let canister_id = asset_canister_id;
    let (result,): ((),) = call(canister_id, "store", (arg, )).await.unwrap();
    "Asset uploaded successfully".to_string()
}

// #[update]
// async fn get_asset(asset_canister_id: Principal, arg: GetArg) -> EncodedAsset {
//     let canister_id = asset_canister_id;
//     let (result,): (EncodedAsset, ) = call(canister_id, "get", (arg, )).await.unwrap();
//     result
// }

export_candid!();