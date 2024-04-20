import '@ton/test-utils';
import { Blockchain } from '@ton/sandbox';
import { NFTItem as NFTItem_collection } from '../build/NFTCollection/tact_NFTItem';
import { NFTItem as NFTItem_item } from '../build/NFTItem/tact_NFTItem';

describe('NFTItem', () => {
    it('should equal', async () => {
        let blockchain = await Blockchain.create();
        let collection = await blockchain.treasury('collection');

        const nftIndex: bigint = 0n;
        const nftItem_collection = await NFTItem_collection.fromInit(collection.address, nftIndex);
        const nftItem_item = await NFTItem_item.fromInit(collection.address, nftIndex);

        console.log(nftItem_collection.address.toString());
        console.log(nftItem_item.address.toString());

        expect(nftItem_collection.address).toEqual(nftItem_item.address);
    });
});
