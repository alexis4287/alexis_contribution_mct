package gov.nasa.arc.mct.gui.actions;

import gov.nasa.arc.mct.components.AbstractComponent;
import gov.nasa.arc.mct.components.DetectGraphicsDevices;
import gov.nasa.arc.mct.context.GlobalContext;
import gov.nasa.arc.mct.gui.ActionContext;
import gov.nasa.arc.mct.gui.ContextAwareAction;
import gov.nasa.arc.mct.gui.View;
import gov.nasa.arc.mct.gui.impl.ActionContextImpl;
import gov.nasa.arc.mct.platform.PlatformImpl;
import gov.nasa.arc.mct.platform.spi.PlatformAccess;

import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class AddObjectsInFavorites extends ContextAwareAction {
    private final static Logger LOGGER = LoggerFactory.getLogger(AddObjectsInFavorites.class);
    private Collection<View> selectedManifestations;
    private ActionContextImpl actionContext;
    private String graphicsDeviceName;

    public AddObjectsInFavorites() {
        super("Add to Favorites");
    }

    @Override
    public boolean canHandle(ActionContext context) {

        actionContext = (ActionContextImpl) context;

        if (DetectGraphicsDevices.getInstance().getNumberGraphicsDevices() > DetectGraphicsDevices.MINIMUM_MONITOR_CHECK) {
            graphicsDeviceName = actionContext.getTargetHousing().getHostedFrame().getGraphicsConfiguration()
                    .getDevice().getIDstring();
            graphicsDeviceName = graphicsDeviceName.replace("\\", "");
        }

        selectedManifestations = context.getSelectedManifestations();
        if (selectedManifestations.isEmpty()) {
            // No objects selected to add to a new collections
            return false;
        }

        // Guards against attempting to put a top level object into a collection
        // as this will result in
        // that collection becoming a child of itself. The prime example of this
        // is the "All" entry in
        // the tree. All necessary contains everything so adding All to All
        // would result in All being a child
        for (View manifestation : selectedManifestations) {
            if (manifestation.getManifestedComponent() == PlatformAccess.getPlatform().getRootComponent()) {
                return false;
            }
        }

        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        LOGGER.info("actionPerformed");

        Set<AbstractComponent> sourceComponents = new LinkedHashSet<AbstractComponent>();
        AbstractComponent favorites = null;
        String usrId = "", favoriteId = "";

        for (View manifestation : selectedManifestations) {
            sourceComponents.add(manifestation.getManifestedComponent());
            LOGGER.info("selectedManifestations");
        }

        usrId = GlobalContext.getGlobalContext().getUser().getUserId();
        LOGGER.info("usrId = " + usrId);

        List<AbstractComponent> bootstrapComponents = PlatformImpl.getInstance().getBootstrapComponents();

        List<AbstractComponent> favoriteList = new ArrayList<AbstractComponent>();
        for (AbstractComponent ac : bootstrapComponents) {
            LOGGER.info(" ac.id = " + ac.getComponentId());
            if ("My Favorites".equals(ac.getDisplayName())) {
                favoriteList.add(ac);
                LOGGER.info("OK External KEY My Favorites");
            }
        }
        for (AbstractComponent ac : favoriteList) {
            if (ac.getOwner().equals(usrId)) {
                favoriteId = ac.getComponentId();
                LOGGER.info("ac.getOwner().equals(usrId)");
            }
        }

        if (!favoriteId.isEmpty())
            favorites = PlatformAccess.getPlatform().getComponentRegistry().getComponent(favoriteId);

        if (sourceComponents.size() > 0 && favorites != null) {
            LOGGER.info("sourceComponents.size() > 0 && favorites != null");
            // Will not be set if there is an exception
            favorites.addDelegateComponents(-1, sourceComponents);
            favorites.save();
        }
    }
}
