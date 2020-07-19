package [[package_name]];

import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

public class AppFunction {
    private static Logger LOG = LoggerFactory.getLogger(AppFunction.class);

    public APIGatewayV2HTTPResponse handleRequest(APIGatewayV2HTTPEvent event) {
        APIGatewayV2HTTPResponse response;
        try {
            LOG.info("Input: {}", event);

            response = createResponse(200);
        } catch (Exception ex) {
            LOG.error("Exception: {}", ex.getMessage(), ex);
            response = createResponse(500);
        }

        response.setHeaders(Map.of("Content-Type", "application/json"));
        return response;
    }

    private APIGatewayV2HTTPResponse createResponse(int status) {
        return APIGatewayV2HTTPResponse.builder()
                .withStatusCode(status)
                .build();
    }
}