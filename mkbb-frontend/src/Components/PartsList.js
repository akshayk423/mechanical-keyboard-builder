import React, {Component} from 'react'
import NavbarComp from './Components/NavbarComponent';
import Lists from './Lists/Lists';

export default class PartLists extends Component{
    render (){
        return(
            <div>
            <NavbarComp></NavbarComp>
            <Lists></Lists>
            </div>
        )
    }   
}

