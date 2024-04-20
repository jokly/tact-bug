# tact-bug

Files are different:

-   [NFTItem](./build/NFTItem/tact_NFTItem.code.fc)
-   [NFTItem](./build/NFTCollection/tact_NFTItem.code.fc) from collection

They differ in function `get_abi_ipfs`, which returns different IPFS hash.

```
_ get_abi_ipfs() method_id {

    return "ipfs://QmYMHufVnBdJM9je3XUNKK8WGUHKHRgDkVg6ygjiTMu3hP";

}
```

If delete `OwnableTransferable` and `Deployable` traits from the `NFTCollection`, then the files `tact_NFTItem.code.fc` are the same.
