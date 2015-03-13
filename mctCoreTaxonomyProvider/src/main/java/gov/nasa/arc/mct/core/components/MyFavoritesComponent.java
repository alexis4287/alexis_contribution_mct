package gov.nasa.arc.mct.core.components;

import gov.nasa.arc.mct.components.AbstractComponent;
import gov.nasa.arc.mct.components.Bootstrap;

/*ALEXIS4287*/
/*ALEXIS4287 (ending)*/
public class MyFavoritesComponent extends AbstractComponent implements Bootstrap {

    public MyFavoritesComponent() {
    }
    
    @Override
    protected <T> T handleGetCapability(Class<T> capability) {
        return capability.isAssignableFrom(getClass()) ?
                capability.cast(this) : super.handleGetCapability(capability);
    }
    
    @Override
    public boolean isGlobal() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean isSandbox() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public int categoryIndex() {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int componentIndex() {
        // TODO Auto-generated method stub
        return 0;
    }

}
