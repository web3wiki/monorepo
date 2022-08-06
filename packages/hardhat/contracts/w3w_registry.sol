pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT



contract W3wRegistry {

    // all pages list array

    string[] public allPagesList;


    // all pages mapping 

     mapping(string => uint256) public getPageArrayPosition;


    // one section struct 

    mapping(string => string) public getPreviousCID;

    struct SectionData {
        string wikiPageName;
        string sectionName;
        string currentCID; // ALTERNATIVE here could be section metadata instead of only pointer, could be packed bytes32
        mapping getPreviousCID;
        address sectionMaintainer;
    }

        // section metadata array, this contains all the sections for all w3w pages
        // @notice this is necessary, because after initiation, dynamics arrays cannot be created 

    SectionData[][] public WikipagesData;


        // helpers 
    // mapping(string => bool) public pageExists;
    mapping(string => uint256) public pagePositionInArray;
    mapping(string => uint256) public lastSectionInArray;
    mapping(string => address) public pageSectionMaintainer; //  sectionHash => managerAddres
    mapping(string => string) public getPreviousHash; //
    mapping(string => SectionMetadata) public getSectionMetadata; // section hash => section metadata
 


    function addNewPage(
        string memory _wikiPageName,
        string[] memory _sectionHashes
    ) external {
        // check if page does not already exists
        require(!pagePositionInArray[_wikiPageName] != 0, "wiki_page_does_already_exist");

        creates new page in array + writes section hashes
        //// section hashes
        SectionMetadata memory element = SectionMetadata(
            "",
            "",
            "_wikiPageName",
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        );
        sections.push(_sectionHashes);

        // wikiPage position pages start from position 1
        pagePositionInArray[_wikiPageName] = sections.length - 1;

        //set last section in array
        lastSectionInArray[_wikiPageName] = _sectionHashes.length - 1;

        // updates array
        pageExists[_wikiPageName] = true;

        // this could be empty if we just create page and allow users to challenge sections
        // there are no maintainers needed, anybody can challenge content and become one
        // problem could be, that if not set in advance, there could be a fight for becoming one
        setpageSectionMaintainer(_wikiPage, _newmaintainer);

        // sets page exists
    }
    

    // todo 
    function createSection() public {

    }

    // todo 
    function updateSection() public {

    }

    // todo 
    function changeMaintainer() public {

    }









}