import "@stdlib/deploy";
import "@stdlib/ownable";
import "./nft_item";

contract NFTCollection with OwnableTransferable, Deployable {
    owner: Address;
    init(owner: Address){
        self.owner = owner;
    }

    receive("Mint"){
        let ctx: Context = context();
        let nftItemInit: StateInit = initOf NFTItem(myAddress(), 0);
        send(SendParameters{
                to: contractAddress(nftItemInit),
                value: ton("0.01"),
                bounce: false,
                mode: SendIgnoreErrors,
                body: Transfer{
                    query_id: 0,
                    new_owner: ctx.sender,
                    response_destination: ctx.sender,
                    custom_payload: emptyCell(),
                    forward_amount: 0,
                    forward_payload: emptySlice()
                }.toCell(),
                code: nftItemInit.code,
                data: nftItemInit.data
            }
        );
    }
}